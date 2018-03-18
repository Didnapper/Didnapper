# Didnapper

## Open the project in RPG Maker XP

RPG Maker XP uses Ruby encoded binary files during development and runtime. In order to convert the json files, here in source control, to the correct format, follow the steps below to encode the files.

* Clone the repository
   ```
   git clone https://github.com/Didnapper/Didnapper
   ```
* Open RpgMakerEncoder, and click `Encode`
   ```
   ./Didnapper/RpgMakerEncoder/RpgMakerEncoder.exe
   ```
* Open the project file in RPG Maker XP
   ```
   ./Didnapper/Didnapper/Game.rxproj
   ```

## Save changes for source control

* Save the changes made in RPG Maker XP
* Open RpgMakerEncoder, and click `Decode`

   ```
   ./Didnapper/RpgMakerEncoder/RpgMakerEncoder.exe
   ```

* Commit the changes
   ```
   git commit
   ```
