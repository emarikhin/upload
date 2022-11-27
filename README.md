## ReadMe

### Preparation

- Create a folder in Google Drive you'll dump all logs into
- Create a project in Google Drive
- Create a `service account` for the project with edit rights
- Get a file containing the service account's secrets, it will be your `auth.json`. It will be stored in the project's `config` folder
- Get a file that contains oauth2 secrets, name it `credentials.json`. It will be stored in the project's root folder. It will have your oauth2 secrets so that you can delete files 


### Installation on the server

- Make sure `node` is installed
- Make sure `npm` is installed
- On the server create a project folder, i.e. `logsUpload`
- cd `logsUpload`
- git clone <project>
- Configure `config/default.json`
    + Modify `config/default.json` to point `folderId` to your Google Drive folder you're going to upload logs into
    + `logPath` remains as default unless customization is needed
    + Modify `config/default.json` to state the prefix the logs on the server start with - `name_server`
    
- Add `config/auth.json`
- Add `credentials.json`
- Add `token.json` once you know it. See `Extra preps steps` below for details
- Create a folder for archived logs, i.e. `archived_logs`
- Implement `dumplogs.sh` (included in the project) based on your vision of the log collection. You'll want to modify the log collection command
- Configure `crontab -e`. Example here:

```bash
01 * * * * . /root/logsUpload/upload/dumplogs/dumplogs.sh
05 * * * * cd /root/logsUpload/upload && node index.js >> /root/logsUpload/upload/uploadLogs.log
```

- In the project's root folder : `npm install`
- If run manually, run `. /root/logsUpload/upload/dumplogs/dumplogs.sh` to generate logs' archived dump
- If run manually, run `node index.js` to upload the archive into the nominated cloud folder.

If cron is configured, the process will be run on schedule


### Extra prep steps

Before running on a server, run it in your local so that you get a `token.json` after you're authorized via browser. Then copy over the token onto the server into the project's root directory

`export OPENSSL_CONF=/dev/null` fixes some oauth2 issues during upload