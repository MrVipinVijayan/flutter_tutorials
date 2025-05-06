from bs4 import BeautifulSoup
import sys

print("\nApp starting...\n")

icons = [
    "home",
    "settings",
    "profile",
    "logout",
    "dashboard",
    "notifications",
    "messages",
    "help",
    "search",
    "favorites",
]


def delete_node_by_tag(react_component_str, tags_to_delete):
    soup = BeautifulSoup(f"<root>{react_component_str}</root>", "html.parser")
    for tag in tags_to_delete:
        for found_tag in soup.find_all(tag):
            found_tag.replace_with(f"{{/* {tag} component is not available */}}")
    return "".join(str(child) for child in soup.root.children)


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
            <home />

            {/* Main content */}
            <main style={{ flex: 1, padding: '1rem' }}>
            <p>Welcome to the app!</p>
            </main>
                <settings />
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
