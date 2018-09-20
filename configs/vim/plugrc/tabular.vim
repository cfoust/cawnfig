" Simple bindings for aligning
Doc t= "Tabular: align on ="
vnoremap <leader>t= :Tab /^[^=]*\zs=/<CR>
Doc t: "Tabular: align on :"
vnoremap <leader>t: :Tab /^[^:]*\zs:/<CR>
