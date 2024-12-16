/**
 * Returns true (e * 100)% of the time.
 * @param {Real} e - The probability to return true.
 * @returns {Bool}
 *
 * @author @ZackBellGames
 * @version 1.0
*/

function chance(e)
{
  return random(1) < e;
}



/**
 * @requires arrays.gml: array_reduce_ext()
 * 
 * Returns the index to the corresponding array element; -1 if the set is empty.
 * @param {Array<Any>} items - The array to process.
 * @param {Function(<Real>): <Real>} [getter_fn] The function to retrieve the odds of the item.
 * @param {Function(<Array<Any>>): <Real>} [sum_fn] The function to sum the total odds with.
 *
 * @author @MaximilianVolt (adaptation only)
 * @author @DragoniteSpam
 * @version 1.0
*/

function chance_weighted(items, getter_fn = function(arr, idx) {
    return arr[idx];
  }, sum_fn = function(acc, curr) {
    return acc + curr;
  }
) {
  var arrlen = array_length(items);

  if (!arrlen)
    return -1;

  var n = random(array_reduce_ext(items, getter_fn, sum_fn));

  for (var i = 0; i < arrlen; n -= getter_fn(items, i++))
    if (n < getter_fn(items, i))
      return i;
}
