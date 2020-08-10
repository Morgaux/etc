augroup fortune_filetype
	autocmd!

	" This augroup allows for the detection of fortune(1) cookie files via
	" a number of methods, namely by checking if the current file is located
	" in a known directory that is used by a common fortune(1)
	" implementation, by checking if the first few lines contain an empty
	" line with just a '%' (a percent sign is used as a fortune delimiter to
	" allow for multi-line fortunes), and lastly if the file has the
	" extension '.fortune' or '.cookie'. If any of these conditions is met,
	" and no other significant FileType has already been detected, then the
	" FileType is set to 'fortune' to be used by the vim-fortune plugin.
	"
	" Common paths include:
	" - /usr/share/games/fortune (OpenBSD)
	" - /sys/games/lib/fortune   (Plan9)
	" - /usr/share/fortune       (Linux)

	if (expand('%:p:h') =~ '^'                      .
	\                      '/\(\(usr\)\|\(sys\)\)/' .
	\                      '\(share/\)\?'           .
	\                      '\(games\?/\)\?'         .
	\                      '\(lib/\)\?'             .
	\                      'fortunes\?'             .
	\                      '$') &&
	\  (expand('%:e') !~ 'dat')
		" current file is in a fortunes directory (but not a '.dat')
		setfiletype fortune
	elseif (index(getline(1, 10), '%') > -1)
		" first ten lines have a '%' on an otherwise empty line
		setfiletype fortune
	elseif (expand('%:e' =~ '\(fortune\)\|\(cookie\)'))
		" file has a fortune format file extension
		setfiletype fortune
	endif
augroup END

