import os
#import yaml
import sys
import re

def read_yaml_header(filepath):
  """
  Reads the YAML header from a file and extracts the title.

  Args:
    filepath: Path to the file.

  Returns:
    A tuple containing the title from the YAML header and the filename with extension.
    Returns None if the file does not exist or has no YAML header.
  """
  try:
    with open(filepath, 'r') as f:
      content = f.read()
      return re.search(r'title: (.*)', content).group(1), os.path.basename(filepath), re.search(r'date: (.*)', content).group(1)
  except FileNotFoundError:
    print(f"File not found: {filepath}")
    return None

if __name__ == "__main__":
  directory = sys.argv[1]
  base = sys.argv[2]
  res = []
  for filename in os.listdir(directory):
    filepath = os.path.join(directory, filename)
    if filename.endswith(('.md', '.yml', '.yaml')):  # Adjust file extensions as needed
      result = read_yaml_header(filepath)
      if result:
        res.append(result)
        
  for title, filename, date in sorted(res, key=lambda x: x[2], reverse=True):
    fname = filename.replace(".md", '')
    print(f'<li><a href="/{base}/{fname}.html">{title}</a></li>')
