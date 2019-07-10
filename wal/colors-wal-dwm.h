static const char norm_fg[] = "#ccdce4";
static const char norm_bg[] = "#0f1213";
static const char norm_border[] = "#8e9a9f";

static const char sel_fg[] = "#ccdce4";
static const char sel_bg[] = "#9C7863";
static const char sel_border[] = "#ccdce4";

static const char urg_fg[] = "#ccdce4";
static const char urg_bg[] = "#566B73";
static const char urg_border[] = "#566B73";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
