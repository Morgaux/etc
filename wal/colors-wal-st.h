const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0f1213", /* black   */
  [1] = "#566B73", /* red     */
  [2] = "#9C7863", /* green   */
  [3] = "#5A7988", /* yellow  */
  [4] = "#6F8E9C", /* blue    */
  [5] = "#8AA3AE", /* magenta */
  [6] = "#A9C3D1", /* cyan    */
  [7] = "#ccdce4", /* white   */

  /* 8 bright colors */
  [8]  = "#8e9a9f",  /* black   */
  [9]  = "#566B73",  /* red     */
  [10] = "#9C7863", /* green   */
  [11] = "#5A7988", /* yellow  */
  [12] = "#6F8E9C", /* blue    */
  [13] = "#8AA3AE", /* magenta */
  [14] = "#A9C3D1", /* cyan    */
  [15] = "#ccdce4", /* white   */

  /* special colors */
  [256] = "#0f1213", /* background */
  [257] = "#ccdce4", /* foreground */
  [258] = "#ccdce4",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
