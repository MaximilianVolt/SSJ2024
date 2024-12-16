/**
 * Performs the specified action for each element in the array. Returns undefined if the array is empty.
 * @param {Array<Any>} arr - The array for the accumulation.
 * @param {Function(<Array<Any>>, <Real>): <Any>} [getter_fn] - The function to get the elements' relevant data for the operation.
 * @param {Function(<Any>, <Any>): <Any>} [callback] - The function to run for each element.
 * @param {Any} [init] - The initial value of the accumulator. If none provided, the first array element will be used.
 * @param {Real} [offset] - The starting index for the operation. A negative offset will wrap back from the end of the array.
 * @param {Real} [count] - The amount of elements to operate with. A negative count will traverse the array backwards.
 * @returns {Any}
 *
 * @author @MaximilianVolt
 * @version 1.0, 2024/10/07
 */

function array_reduce_ext(arr, getter_fn = function(arr, index) { return arr[index]; }, callback = function(acc, curr) {
		return acc + curr;
	}, init = undefined, offset = 0, count = undefined
) {
	var arrlen = array_length(arr);

	if (!arrlen)
		return undefined;

	offset = (arrlen + offset) % arrlen;
	count ??= arrlen;

	var incr = sign(count);
	var i_last = clamp(offset + count, -1, arrlen);

	init = init != undefined
		? callback(init, getter_fn(arr, offset))
		:	getter_fn(arr, offset);

	for (var i = offset + incr; i != i_last; i += incr)
		init = callback(init, getter_fn(arr, i));

	return init;
}