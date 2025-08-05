# Note: JEKYLL_ROOTLESS is required for podman
update:
	mkdir -p vendor/bundle
	docker run --rm -it \
		-e JEKYLL_ROOTLESS=1 \
		--volume="$(shell pwd):/srv/jekyll" \
		--volume="$(shell pwd)/vendor/bundle:/usr/local/bundle" \
		docker.io/jekyll/jekyll:4.2.2 \
		sh -c "bundle config unset deployment && bundle update && bundle install --deployment"

doctor:
	mkdir -p vendor/bundle
	docker run --rm -it \
		-e JEKYLL_ROOTLESS=1 \
		--volume="$(shell pwd):/srv/jekyll" \
		--volume="$(shell pwd)/vendor/bundle:/usr/local/bundle" \
		docker.io/jekyll/jekyll:4.2.2 \
		jekyll doctor

serve:
	mkdir -p vendor/bundle
	docker run --rm -it \
		-e JEKYLL_ROOTLESS=1 \
		--volume="$(shell pwd):/srv/jekyll" \
		--volume="$(shell pwd)/vendor/bundle:/usr/local/bundle" \
		-p 4000:4000 docker.io/jekyll/jekyll:4.2.2 \
		jekyll serve 

serve-drafts:
	mkdir -p vendor/bundle
	docker run --rm -it \
		-e JEKYLL_ROOTLESS=1 \
		--volume="$(shell pwd):/srv/jekyll" \
		--volume="$(shell pwd)/vendor/bundle:/usr/local/bundle" \
		-p 4000:4000 docker.io/jekyll/jekyll:4.2.2 \
		jekyll serve --drafts

serve-future:
	mkdir -p vendor/bundle
	docker run --rm -it \
		-e JEKYLL_ROOTLESS=1 \
		--volume="$(shell pwd):/srv/jekyll" \
		--volume="$(shell pwd)/vendor/bundle:/usr/local/bundle" \
		-p 4000:4000 docker.io/jekyll/jekyll:4.2.2 \
		jekyll serve --future
