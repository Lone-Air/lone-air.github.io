all:
	psml WebSite.psml -quiet -o .
	dos2unix < WebSite.psml > WebSite-DosF.psml
