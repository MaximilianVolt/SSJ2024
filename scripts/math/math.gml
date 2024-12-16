/// Often used



/**
 * Checks if a value is inside a range.
 * @param {Real} value - The value to check. 
 * @param {Real} min_value - The minimum value of the range. 
 * @param {Real} max_value - The maximum value of the range. 
 */

function in_range(value, min_value, max_value)
{
  return (value >= min_value) & (value <= max_value);
}



/**
 * Checks if a value is strictly inside a range.
 * @param {Real} value - The value to check. 
 * @param {Real} min_value - The minimum value of the range. 
 * @param {Real} max_value - The maximum value of the range. 
 */

function in_range_strict(value, min_value, max_value)
{
  return (value > min_value) & (value < max_value);
}



/**
 * Checks if a value is inside a range of a certain wheel_range_amplitudeitude.
 * @param {Real} value - The value to check. 
 * @param {Real} target - The value to compare. 
 * @param {Real} range - The range difference to consider. 
 */

function in_range_difference(value, target, range)
{
  return (value >= target - range) & (value <= target + range);
}



/**
 * Checks if a value is strictly inside a range of a certain wheel_range_amplitudeitude.
 * @param {Real} value - The value to check. 
 * @param {Real} target - The value to compare. 
 * @param {Real} range - The range difference to consider. 
 */

function in_range_difference_strict(value, target, range)
{
  return (value > target - range) & (value < target + range);
}



/**
 * Gradually makes a value approach to another.
 * @param {Real} value  - The starting value.
 * @param {Real} target - The value to approach to.
 * @param {Real} [smoothness] - The smoothness factor (smoothness >= 1) to approach the target value with.
 * @param {Real} [treshold] - The minimum difference between the values for which the smoothing is required.
 * @returns {Real}
 * 
 * @author @MaximilianVolt
 * @version 1.0
*/

function smoothen(value, target, smoothness = 10, treshold = math_get_epsilon())
{
  var distance_difference = target - value;

  return (abs(distance_difference) > treshold)
    ? value + distance_difference / smoothness
    : target
	;
}



/**
 * Makes a value approach to another.
 * @param {Real} value - The starting value.
 * @param {Real} target - The value to approach to.
 * @param {Real} amount - The amount to approach the target value with.
 * @returns {Real}
 * 
 * @author @MaximilianVolt
 * @version 1.0
*/

function approach(value, target, amount)
{
	return (value < target) ? min(value + amount, target) : max(value - amount, target);
}



/**
 * Sets a value following a corresponding sinusoidal function.
 * @param {Real} from - The starting value.
 * @param {Real} to - The ending value.
 * @param {Real} duration - The duration (in seconds) of the period.
 * @param {Real} [offset] - The offset of the period.
 * @returns {Real}
*/

function wave(from, to, duration, offset = 0)
{
	var half_wave = (to - from) / 2;
	return from + half_wave + sin((current_time / 1000 + duration * offset) / duration * pi * 2) * half_wave;
}



/// Bit operations



/**
 * Returns the number of set bits (1's) of a number.
 * @param {Real} n - The number to process.
 * @returns {Real}
 *
 * @version 1.0
 */

function math_bits_get_set_bits_count(n)
{
  var count = 0;

  while (n)
  {
    count += n & 1;
    n = n >> 1;
  }

  return count;
}



/**
 * @requires math.gml: math_bits_get_set_bits_count()
 *
 * Returns the number of mismatching bits between two numbers.
 * @param {Real} a - The first number.
 * @param {Real} b - The second number.
 * @returns {Real}
 *
 * @author Brian Kernighan
 * @version 1.0
 */

function math_bits_get_difference_count(a, b)
{
  return math_bits_get_set_bits_count(a ^ b);
}



/// Easing functions - https://www.easings.net



/**
 * Sine ease-in function.
 * @param {Real} x - The value to ease.
 * @returns {Real}
 * 
 * @author @MaximilianVolt (adaptation only)
 * @author Andrey Sitnik
 * @author Ivan Solovev
 * @version 1.0
 */

function math_ease_in_sine(x)
{
  return 1 - cos(x * pi / 2);
}



/**
 * Sine ease-out function.
 * @param {Real} x - The value to ease.
 * @returns {Real}
 * 
 * @author @MaximilianVolt (adaptation only)
 * @author Andrey Sitnik
 * @author Ivan Solovev
 * @version 1.0
 */

function math_ease_out_sine(x)
{
  return cos(x * pi / 2);
}



/**
 * Sine ease-in-out function.
 * @param {Real} x - The value to ease.
 * @returns {Real}
 * 
 * @author @MaximilianVolt (adaptation only)
 * @author Andrey Sitnik
 * @author Ivan Solovev
 * @version 1.0
 */

function math_ease_in_out_sine(x)
{
  return (1 - cos(x * pi)) / 2;
}



/**
 * Quadratic ease-in function.
 * @param {Real} x - The value to ease.
 * @returns {Real}
 * 
 * @author @MaximilianVolt (adaptation only)
 * @author Andrey Sitnik
 * @author Ivan Solovev
 * @version 1.0
 */

function math_ease_in_quadratic(x)
{
  return x * x;
}



/**
 * Quadratic ease-out function.
 * @param {Real} x - The value to ease.
 * @returns {Real}
 * 
 * @author @MaximilianVolt (adaptation only)
 * @author Andrey Sitnik
 * @author Ivan Solovev
 * @version 1.0
 */

function math_ease_out_quadratic(x)
{
  return -x * x + 2 * x;
}



/**
 * Quadratic ease-in-out function.
 * @param {Real} x - The value to ease.
 * @returns {Real}
 * 
 * @author @MaximilianVolt (adaptation only)
 * @author Andrey Sitnik
 * @author Ivan Solovev
 * @version 1.0
 */

function math_ease_in_out_quadratic(x)
{
  return x ? 1 - 2 * (x * x + x - 1) : 2 * x * x;
}



/**
 * Cubic ease-in function.
 * @param {Real} x - The value to ease.
 * @returns {Real}
 * 
 * @author @MaximilianVolt (adaptation only)
 * @author Andrey Sitnik
 * @author Ivan Solovev
 * @version 1.0
 */

function math_ease_in_cubic(x)
{
  return x * x * x;
}



/**
 * Cubic ease-out function.
 * @param {Real} x - The value to ease.
 * @returns {Real}
 * 
 * @author @MaximilianVolt (adaptation only)
 * @author Andrey Sitnik
 * @author Ivan Solovev
 * @version 1.0
 */

function math_ease_out_cubic(x)
{
  return 1 - power(1 - x, 3);
}



/**
 * Cubic ease-in-out function.
 * @param {Real} x - The value to ease.
 * @returns {Real}
 * 
 * @author @MaximilianVolt (adaptation only)
 * @author Andrey Sitnik
 * @author Ivan Solovev
 * @version 1.0
 */

function math_ease_in_out_cubic(x)
{
  return x ? 1 - power(-2 * x + 2, 3) / 2 : 4 * x * x * x;
}



/**
 * Polynomial-general ease-in function.
 * @param {Real} x - The value to ease.
 * @param {Real} d - The degree of the polynomial.
 * @returns {Real}
 * 
 * @author @MaximilianVolt
 * @version 1.0
 */

function math_ease_in_polynomial(x, d)
{
  return power(x, d);
}



/**
 * Polynomial-general ease-out function.
 * @param {Real} x - The value to ease.
 * @param {Real} d - The degree of the polynomial.
 * @returns {Real}
 * 
 * @author @MaximilianVolt
 * @version 1.0
 */

function math_ease_out_polynomial(x, d)
{
  return 1 - power(1 - x, d);
}



/**
 * Polynomial-general ease-in-out function.
 * @param {Real} x - The value to ease.
 * @param {Real} d - The degree of the polynomial.
 * @returns {Real}
 * 
 * @author @MaximilianVolt
 * @version 1.0
 */

function math_ease_in_out_polynomial(x, d)
{
  return x ? 1 - power(-2 * x + 2, d) / 2 : power(x, d) * (1 << d - 1);
}



/**
 * Exponential ease-in function.
 * @param {Real} x - The value to ease.
 * @returns {Real}
 * 
 * @author @MaximilianVolt (adaptation only)
 * @author Andrey Sitnik
 * @author Ivan Solovev
 * @version 1.0
 */

function math_ease_in_exponential(x)
{
  return (x != 0) * power(2, 10 * x - 10);
}



/**
 * Exponential ease-out function.
 * @param {Real} x - The value to ease.
 * @returns {Real}
 * 
 * @author @MaximilianVolt (adaptation only)
 * @author Andrey Sitnik
 * @author Ivan Solovev
 * @version 1.0
 */

function math_ease_out_exponential(x)
{
  return 1 - (x != 1) * power(2, -10 * x);
}



/**
 * Exponential ease-in-out function.
 * @param {Real} x - The value to ease.
 * @returns {Real}
 * 
 * @author @MaximilianVolt (adaptation only)
 * @author Andrey Sitnik
 * @author Ivan Solovev
 * @version 1.0
 */

function math_ease_in_out_exponential(x)
{
  return x == 0
    ? 0
    : (x == 1
      ? 1
      : (x < 0.5 
        ? power(2, 20 * x - 10) / 2
        : (2 - power(2, -20 * x + 10)) / 2
      )
    )
	;
}



/**
 * Circular ease-in function.
 * @param {Real} x - The value to ease.
 * @returns {Real}
 * 
 * @author @MaximilianVolt (adaptation only)
 * @author Andrey Sitnik
 * @author Ivan Solovev
 * @version 1.0
 */

function math_ease_in_circular(x)
{
  return 1 - sqrt(1 - x * x);
}



/**
 * Circular ease-out function.
 * @param {Real} x - The value to ease.
 * @returns {Real}
 * 
 * @author @MaximilianVolt (adaptation only)
 * @author Andrey Sitnik
 * @author Ivan Solovev
 * @version 1.0
 */

function math_ease_out_circular(x)
{
  return sqrt(-x * x + 2 * x);
}



/**
 * Circular ease-in-out function.
 * @param {Real} x - The value to ease.
 * @returns {Real}
 * 
 * @author @MaximilianVolt (adaptation only)
 * @author Andrey Sitnik
 * @author Ivan Solovev
 * @version 1.0
 */

function math_ease_in_out_circular(x)
{
  return x
    ? (sqrt(1 - power(-2 * x + 2, 2)) + 1) / 2
    : (1 - sqrt(1 - power(2 * x, 2))) / 2
	;
}



/**
 * Backwards ease-in function.
 * @param {Real} x - The value to ease.
 * @returns {Real}
 * 
 * @author @MaximilianVolt (adaptation only)
 * @author Andrey Sitnik
 * @author Ivan Solovev
 * @version 1.0
 */

function math_ease_in_backwards(x)
{
  var c1 = 1.70158;
  var c3 = c1 + 1;

  return c3 * x * x * x - c1 * x * x;
}



/**
 * Backwards ease-out function.
 * @param {Real} x - The value to ease.
 * @returns {Real}
 * 
 * @author @MaximilianVolt (adaptation only)
 * @author Andrey Sitnik
 * @author Ivan Solovev
 * @version 1.0
 */

function math_ease_out_backwards(x)
{
  var c1 = 1.70158;
  var c3 = c1 + 1;
  
  return 1 + c3 * power(x - 1, 3) + c1 * power(x - 1, 2);
}



/**
 * Backwards ease-in-out function.
 * @param {Real} x - The value to ease.
 * @returns {Real}
 * 
 * @author @MaximilianVolt (adaptation only)
 * @author Andrey Sitnik
 * @author Ivan Solovev
 * @version 1.0
 */

function math_ease_in_out_backwards(x)
{
  var c1 = 1.70158;
  var c2 = c1 * 1.525;
  
  return x
    ? (power(2 * x - 2, 2) * ((c2 + 1) * (x * 2 - 2) + c2) + 2) / 2
    : (power(2 * x, 2) * ((c2 + 1) * 2 * x - c2)) / 2
	;
}



/**
 * Elastic ease-in function.
 * @param {Real} x - The value to ease.
 * @returns {Real}
 * 
 * @author @MaximilianVolt (adaptation only)
 * @author Andrey Sitnik
 * @author Ivan Solovev
 * @version 1.0
 */

function math_ease_in_elastic(x)
{
  var c4 = pi * 2 / 3;

  return x == 0
    ? 0
    : (x == 1
      ? 1
      : -power(2, 10 * x - 10) * sin((x * 10 - 10.75) * c4)
    )
	;
}



/**
 * Elastic ease-out function.
 * @param {Real} x - The value to ease.
 * @returns {Real}
 * 
 * @author @MaximilianVolt (adaptation only)
 * @author Andrey Sitnik
 * @author Ivan Solovev
 * @version 1.0
 */

function math_ease_out_elastic(x)
{
  var c4 = pi * 2 / 3;

  return x == 0
    ? 0
    : (x == 1
      ? 1
      : power(2, -10 * x) * sin((x * 10 - 0.75) * c4) + 1
    )
	;
}



/**
 * Elastic ease-in-out function.
 * @param {Real} x - The value to ease.
 * @returns {Real}
 * 
 * @author @MaximilianVolt (adaptation only)
 * @author Andrey Sitnik
 * @author Ivan Solovev
 * @version 1.0
 */

function math_ease_in_out_elastic(x)
{
  var c5 = pi / 2.25;

  return x == 0
    ? 0
    : (x == 1
      ? 1
      : (x
        ? power(2, -20 * x + 10) * sin((20 * x - 11.125) * c5) / 2 + 1
        : -power(2, 20 * x - 10) * sin((20 * x - 11.125) * c5) / 2
      )
    )
	;
}



/**
 * @requires math.gml: math_ease_out_bounce()
 *
 * Bounce ease-in function.
 * @param {Real} x - The value to ease.
 * @returns {Real}
 * 
 * @author @MaximilianVolt (adaptation only)
 * @author Andrey Sitnik
 * @author Ivan Solovev
 * @version 1.0
 */

function math_ease_in_bounce(x)
{
  return 1 - math_ease_out_bounce(1 - x);
}



/**
 * Bounce ease-out function.
 * @param {Real} x - The value to ease.
 * @returns {Real}
 * 
 * @author @MaximilianVolt (adaptation only)
 * @author Andrey Sitnik
 * @author Ivan Solovev
 * @version 1.0
 */

function math_ease_out_bounce(x)
{
  var n1 = 7.5625;
  var d1 = 2.75;

  return x < 1 / d1
    ? n1 * x * x
    : (x < 2 / d1
      ? n1 * power(x - 1.5 / d1, 2) + 0.75
      : (x < 2.5 / d1
        ? n1 * power(x - 2.25 / d1, 2) + 0.9375
        : n1 * power(x - 2.625 / d1, 2) + 0.984375
      )
    )
	;
}



/**
 * Bounce ease-in-out function.
 * @param {Real} x - The value to ease.
 * @returns {Real}
 * 
 * @author @MaximilianVolt (adaptation only)
 * @author Andrey Sitnik
 * @author Ivan Solovev
 * @version 1.0
 */

function math_ease_in_out_bounce(x)
{
  return x
    ? (1 + math_ease_out_bounce(2 * x - 1)) / 2
    : (1 - math_ease_out_bounce(1 - 2 * x)) / 2
	;
}