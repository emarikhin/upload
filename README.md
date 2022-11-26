### ReadMe


### Preparation

- Create a folder in Google Drive you'll dump all logs into
- Create a project in Google Drive
- Create a `service account` for the project with edit rights

1. Modify `config/default.json` to point `folderId` to your Google Drive folder you're going to upload logs into
2. Modify `config/default.json` to point `logPath` to the folder you're going to read log files off on your server
3. Modify `config/default.json` to state the prefix the logs on the server start with - `serverA_logs`
4. `config/auth.json` should have your auth secrets
5. `credentials.json` should have your oath2 secrets so that you can delete files
6. `token.json` will be created after you've authenticated with `credentials.json`
7. 


### Installation on the server

- Make sure `node` is installed
- On the server create a project folder, i.e. `logsUpload`
- cd `logsUpload`
- git clone <project>
- Configure `config/default.json`
- Implement `dumplogs.sh` based on your vision of the log collection
- Configure `crontab -e`. Example here:

```bash
01 * * * * . /root/log-collection/dumplogs.sh
03 * * * * cd /root/log-collection/uploadIntoGoogleDrive && node index.js >> /root/log-collection/logs/uploadIntoGoogleDrive.log
```

- `npm install`
- `node index.js`
