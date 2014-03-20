SRCDIRS = `find * -prune\
	  -type d 	\
	  ! -name CVS	\
          ! -name cipres-modules \
	  ! -name .` cipres-modules
