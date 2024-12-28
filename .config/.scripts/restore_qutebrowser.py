import sqlite3
import os
import subprocess

# Path to Qutebrowser's history database
history_db = os.path.expanduser("~/.local/share/qutebrowser/history.sqlite")

# Number of recent tabs to restore
recent_tabs = 5


def get_recent_history(db_path, limit):
    with sqlite3.connect(db_path) as conn:
        cursor = conn.cursor()
        query = "SELECT url FROM history ORDER BY at DESC LIMIT ?"
        cursor.execute(query, (limit,))
        return [row[0] for row in cursor.fetchall()]


def open_tabs(urls):
    for url in urls:
        subprocess.run(["qutebrowser", "--target", "tab", url])


if os.path.exists(history_db):
    recent_urls = get_recent_history(history_db, recent_tabs)
    open_tabs(recent_urls)
else:
    print("History database not found!")
