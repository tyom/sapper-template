rollup:
	node ./_template/build-pkg.js rollup
	# Restore Rollup config if it's hidden
	if test -f _rollup.config.js; then _mv rollup.config.js _rollup.config.js; fi
	yarn

webpack:
	node ./_template/build-pkg.js webpack
	# Hide Rollup config for Webpack
	if test -f rollup.config.js; then mv rollup.config.js _rollup.config.js; fi
	yarn

clean:
	# Restore Rollup config if it's hidden
	if test -f _rollup.config.js; then mv _rollup.config.js rollup.config.js; fi
	rm package.json
	rm yarn.lock

.PHONY: rollup webpack clean
