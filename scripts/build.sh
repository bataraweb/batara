

# blog


for file in "../blog"/*.md; do
  # Check if the file is a regular file (not a directory)
  if [[ -f "$file" ]]; then
    # Construct the output file name (e.g., replace .md with .pdf)
    output_file="../docs/blog/${file%.*}.html" 

    # Run pandoc with the specified input and output files
    pandoc "$file" -o "$output_file" --template ../templates/base.html

    # Optionally, add more pandoc options here
    # For example:
    # pandoc "$file" -o "$output_file" --from markdown --to pdf 
  fi
done




#blogstuff=$(uv run build_blog.py ../blog blog)
#promptstuff=$(uv run build_blog.py ../prompts prompts)

#escaped_html_content=$blogstuff # $(echo "$blogstuff" | sed 's/[\&<>"]/\\\&/g') 
#escaped_prompts_content=$promptstuff # $(echo "$blogstuff" | sed 's/[\&<>"]/\\\&/g') 

pandoc -o ../docs/index.html ../pages/index.md  --template ../templates/index.html --metadata title="Yayasan Batara"
# pandoc -o ../docs/about.html ../pages/about.md --template ../templates/base.html --metadata title="about"




for file in "../blog"/*.pdf; do
  if [[ -f "$file" ]]; then
    cp "$file" "../docs/blog/"
  fi
done
