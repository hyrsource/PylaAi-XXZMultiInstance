# PylaAi-XXZMultiInstance

PylaAi-XXZMultiInstance is a fork of PylaAi-XXZ focused on providing stable multi-instance support for unattended 24/7 operation.

## Installation
1. Clone or download this repository.
2. Double Click `setup.bat` or Run `python setup.py` 
3. Open `multi_instance_add_instance.bat`.
4. Configure your instances in the GUI.
5. Make sure you have a Brawl Stars API key if you want automatic player tag and trophy autofill (see below).
6. Run:

```bash
python main.py --instance <INSTANCE_ID>
```

7. Press **START**, select your brawlers, or use **Push All 1k**.

## Brawl Stars API Trophy Autofill

1. Create a developer account at https://developer.brawlstars.com/
2. Open `cfg/brawl_stars_api.toml`.
3. Fill in:

```toml
player_tag = "#YOURTAG"
developer_email = "YOUR_DEVELOPER_EMAIL"
developer_password = "YOUR_DEVELOPER_PASSWORD"
```

When a brawler is selected in the brawler selection window, the current trophy count is automatically retrieved from the API.

The auto-refresh feature:

* Logs into the official developer portal.
* Detects the current public IP address.
* Deletes old PylaAi-XXZ-created API keys.
* Creates a new API key for the current IP.
* Stores the generated token locally.

Keep:

```toml
delete_all_tokens = false
```

unless you intentionally want to remove every API key from the developer account.

**Never commit a filled `cfg/brawl_stars_api.toml` file.**
Email addresses, passwords, and API tokens should always remain blank in the repository.

## Discord Remote Control
- Discord Remote Control is supported, you need one discord bot for each instance
## Telegram Remote Control
- Telegram Remote Control is currently not supported in this version

## Developers

* Iyordanov
* AngelFire

## Contributing

Contributions are welcome.

Feel free to:

* Open an Issue.
* Submit a Pull Request.
* Join the Pyla Discord server:

https://discord.gg/xUusk3fw4A

## Roadmap

Check the public Trello board for planned features and known issues:

https://trello.com/b/SAz9J6AA/public-pyla-trello
