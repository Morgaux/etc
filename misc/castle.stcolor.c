// BEST!!! Custom - DbT6rVC.png

/* Terminal colors (16 first used in escape sequence) */
static const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#273537", /* black   */
  [1] = "#943a2c", /* red     */
  [2] = "#3e453d", /* green   */
  [3] = "#efa72b", /* yellow  */
  [4] = "#2d465f", /* blue    */
  [5] = "#40566b", /* magenta */
  [6] = "#81adb8", /* cyan    */
  [7] = "#aac0c2", /* white   */

  /* 8 bright colors */
  [8]  = "#3f4f51", /* black   */
  [9]  = "#df4b35", /* red     */
  [10] = "#565d55", /* green   */
  [11] = "#f7e29b", /* yellow  */
  [12] = "#415c71", /* blue    */
  [13] = "#cf9684", /* magenta */
  [14] = "#a4cbda", /* cyan    */
  [15] = "#e9f8fd", /* white   */

  /* special colors */
  [256] = "#273537", /* background */
  [257] = "#e9f8fd", /* foreground */
};

/*
 * Default colors (colorname index)
 * foreground, background, cursor
 */
static unsigned int defaultfg = 257;
static unsigned int defaultbg = 256;
static unsigned int defaultcs = 257;

/*
 * Colors used, when the specific fg == defaultfg. So in reverse mode this
 * will reverse too. Another logic would only make the simple feature too
 * complex.
 */
static unsigned int defaultitalic = 7;
static unsigned int defaultunderline = 7;
