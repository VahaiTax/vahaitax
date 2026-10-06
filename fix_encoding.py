import os

fixes = {
    '\u00c2\u00b7': '\u00b7',           # middle dot
    '\u00e2\u20ac\u201d': '\u2014',     # em dash
    '\u00e2\u20ac\u201c': '\u2013',     # en dash
    '\u00c2\u00a9': '\u00a9',           # copyright
    '\u00c3\u00a0': '\u00e0',           # a grave
    '\u00c3\u00a9': '\u00e9',           # e acute
    '\u00c3\u00a8': '\u00e8',           # e grave
    '\u00c3\u00af': '\u00ef',           # i trema
    '\u00c3\u00a7': '\u00e7',           # c cedilla
    '\u00c3\u00aa': '\u00ea',           # e circumflex
    '\u00c3\u00b4': '\u00f4',           # o circumflex
}

def fix_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    for bad, good in fixes.items():
        content = content.replace(bad, good)
        
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(content)

for root, _, files in os.walk('c:/Projects/vahaisinglepage'):
    for file in files:
        if file.endswith('.html') or file.endswith('.css'):
            fix_file(os.path.join(root, file))
