const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0C0201", /* black   */
  [1] = "#B45344", /* red     */
  [2] = "#936858", /* green   */
  [3] = "#CA5B4B", /* yellow  */
  [4] = "#D4614F", /* blue    */
  [5] = "#898C7A", /* magenta */
  [6] = "#C9D4BA", /* cyan    */
  [7] = "#cae4d9", /* white   */

  /* 8 bright colors */
  [8]  = "#8d9f97",  /* black   */
  [9]  = "#B45344",  /* red     */
  [10] = "#936858", /* green   */
  [11] = "#CA5B4B", /* yellow  */
  [12] = "#D4614F", /* blue    */
  [13] = "#898C7A", /* magenta */
  [14] = "#C9D4BA", /* cyan    */
  [15] = "#cae4d9", /* white   */

  /* special colors */
  [256] = "#0C0201", /* background */
  [257] = "#cae4d9", /* foreground */
  [258] = "#cae4d9",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
