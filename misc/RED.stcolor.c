// Custom - RED.jpg

/* Terminal colors (16 first used in escape sequence) */
static const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#06083b", /* black   */
  [1] = "#3a1534", /* red     */
  [2] = "#48766e", /* green   */
  [3] = "#31616d", /* yellow  */
  [4] = "#182f5c", /* blue    */
  [5] = "#0c144e", /* magenta */
  [6] = "#2d5266", /* cyan    */
  [7] = "#ffedf5", /* white   */

  /* 8 bright colors */
  [8]  = "#d5d9d1", /* black   */
  [9]  = "#b52540", /* red     */
  [10] = "#8aa589", /* green   */
  [11] = "#e38018", /* yellow  */
  [12] = "#264265", /* blue    */
  [13] = "#7f4360", /* magenta */
  [14] = "#39496f", /* cyan    */
  [15] = "#feebe8", /* white   */

  /* special colors */
  [256] = "#06083b", /* background */
  [257] = "#feebe8", /* foreground */
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
