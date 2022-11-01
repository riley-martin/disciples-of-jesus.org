all: pages markdown

markdown: md/about.md md/av.md md/contact.md md/home.md
	for item in "about" "av" "contact" "home"; do \
		python3 -m markdown -o html "md/$$item.md" > "md/$$item.html"; \
	done

pages: markdown templates/about.html templates/av.html templates/contact.html templates/index.html
	for item in "about.html" "av.html" "contact.html" "index.html"; do \
		cpp -P -H -ftrack-macro-expansion=0 "templates/$$item" "$$item"; \
	done

clean:
	rm "about.html" "av.html" "contact.html" "index.html" "md/about.html" "md/av.html" "md/contact.html" "md/home.html"

