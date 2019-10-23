all: output

XHTML = shlomif-putting-cards-on-the-table-2019-2020.xhtml
XHTML_MAIN = $(XHTML)/index.html

output: $(XHTML_MAIN)

$(XHTML_MAIN): shlomif-putting-cards-on-the-table-2019-2020.docbook5.xml
	docmake -v \
	--stringparam "docmake.output.format=xhtml" \
	--stringparam "docmake.output.path_to_root=../../" \
	--stringparam "docmake.output.work_in_progress=1" \
	-x lib/sgml/shlomif-docbook/xsl-5-stylesheets/shlomif-essays-5-xhtml.xsl -o "$(XHTML)" xhtml-1_1 $<
