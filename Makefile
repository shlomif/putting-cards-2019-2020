all: output

XHTML = shlomif-putting-cards-on-the-table-2019-2020
XHTML_MAIN = index.xhtml
XSLT_MAIN = lib/sgml/shlomif-docbook/xsl-5-stylesheets/shlomif-essays-5-xhtml-onechunk.xsl

output: $(XHTML_MAIN)

$(XHTML_MAIN): shlomif-putting-cards-on-the-table-2019-2020.docbook5.xml $(XSLT_MAIN)
	docmake -v \
		--trailing-slash=0 \
	--stringparam "docmake.output.format=xhtml" \
	--stringparam "docmake.output.work_in_progress=1" \
	-x "$(XSLT_MAIN)" -o "$(XHTML)" xhtml5 $<

$(XSLT_MAIN):
	perl bin/my-cookiecutter.pl

clean:
	rm -fr $(XHTML_MAIN)

test: all
	prove t/*.t
