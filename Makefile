all: output

XHTML = shlomif-putting-cards-on-the-table-2019-2020
XHTML_MAIN = index.xhtml

output: $(XHTML_MAIN)

$(XHTML_MAIN): shlomif-putting-cards-on-the-table-2019-2020.docbook5.xml
	docmake -v \
		--trailing-slash=0 \
	--stringparam "docmake.output.format=xhtml" \
	--stringparam "docmake.output.work_in_progress=1" \
	-x lib/sgml/shlomif-docbook/xsl-5-stylesheets/shlomif-essays-5-xhtml-onechunk.xsl -o "$(XHTML)" xhtml5 $<

clean:
	rm -fr $(XHTML_MAIN)
