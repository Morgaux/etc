// DOS colors

/* Terminal colors (16 first used in escape sequence) */
static const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#a80000", /* red     */
  [2] = "#00a800", /* green   */
  [3] = "#a85400", /* yellow  */
  [4] = "#0000a8", /* blue    */
  [5] = "#a800a8", /* magenta */
  [6] = "#00a8a8", /* cyan    */
  [7] = "#a8a8a8", /* white   */

  /* 8 bright colors */
  [8]  = "#545454", /* black   */
  [9]  = "#fc5454", /* red     */
  [10] = "#54fc54", /* green   */
  [11] = "#fcfc54", /* yellow  */
  [12] = "#5454fc", /* blue    */
  [13] = "#fc54fc", /* magenta */
  [14] = "#54fcfc", /* cyan    */
  [15] = "#fcfcfc", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#a8a8a8", /* foreground */
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
