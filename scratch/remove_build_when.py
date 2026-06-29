import os

def clean_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    # Normalise line endings to \n for replacement, then write back in local style
    original_has_crlf = "\r\n" in content
    norm_content = content.replace("\r\n", "\n")

    modified = False

    # List of targets to clean
    targets = [
        "      buildWhen: (prev, curr) => prev.runtimeType != curr.runtimeType,\n",
        "      buildWhen: (previous, current) => previous.runtimeType != current.runtimeType,\n",
        "      buildWhen: (prev, curr) =>\n          prev.runtimeType != curr.runtimeType,\n",
        "      buildWhen: (previous, current) =>\n          previous.runtimeType != current.runtimeType,\n",
    ]

    for target in targets:
        if target in norm_content:
            norm_content = norm_content.replace(target, "")
            modified = True

    if modified:
        if original_has_crlf:
            norm_content = norm_content.replace("\n", "\r\n")
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(norm_content)
        print(f"Cleaned buildWhen in: {filepath}")

def main():
    lib_dir = "lib"
    for root, dirs, files in os.walk(lib_dir):
        for file in files:
            if file.endswith(".dart"):
                clean_file(os.path.join(root, file))

if __name__ == "__main__":
    main()
