from bs4 import BeautifulSoup
import sys
from lxml import etree
from io import StringIO
import re

print("\nApp starting...\n")

icons = [
    "OriginalHome",
    "OriginalSettings",
    "OriginalProfile",
    "OriginalLogout",
    "OriginalDashboard",
    "OriginalNotifications",
    "OriginalMessages",
    "OriginalHelp",
    "OriginalSearch",
    "OriginalFavorites",
]


def delete_node_by_tag(react_component_str, tags_to_not_delete=None):
    if tags_to_not_delete is None:
        tags_to_not_delete = []

    result = react_component_str
    # Find all component tags in the JSX string
    tag_pattern = r"<([A-Z][A-Za-z0-9]*)"
    found_tags = set(re.findall(tag_pattern, result))

    # Process each found tag
    for tag in found_tags:
        if tag not in tags_to_not_delete:
            print(f"Deleting tag: {tag}")
            # Match exact case for both self-closing and regular tags
            pattern = rf"<{re.escape(tag)}(\s+[^>]*)?/>|<{re.escape(tag)}(\s+[^>]*)?>(.*?)</{re.escape(tag)}>"
            replacement = f"{{/* {tag} component is not available */}}"
            result = re.sub(pattern, replacement, result, flags=re.DOTALL)

    return result


jsx_str = """
    export default () => (
        <div style={{ display: 'flex', flexDirection: 'column', height: '100vh' }}>
            {/* Header */}
            <header style={{
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'space-between',
            padding: '1rem',
            backgroundColor: '#333',
            color: '#fff'
            }}>
            <div
                style={{ fontSize: '24px', cursor: 'pointer' }}
                onClick={() => alert('Menu clicked')}
            >
                &#9776;
            </div>
            <h1 style={{ margin: 0, fontSize: '20px' }}>My App</h1>
            </header>
            <Home />
            <OriginalFavorites />
            <OriginalFavoriteStar />
            <OriginalSettings1 />
            {/* Main content */}
            <main style={{ flex: 1, padding: '1rem' }}>
            <p>Welcome to the app!</p>
            </main>
                <Settings />
            {/* Footer */}
            <footer style={{
            padding: '1rem',
            backgroundColor: '#f1f1f1',
            textAlign: 'center'
            }}>
            <p style={{ margin: 0 }}>&copy; 2025 My App</p>
            </footer>
        </div>
    );
    """

result = delete_node_by_tag(jsx_str, icons)
print(result)
