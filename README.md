# Docker containers for tricoteuses application

This repo is an intent to provide docker containers for tricoteuses application. 

Tricoteuses is an application of [parlement ouvert](https://framagit.org/parlement-ouvert) which intends to open the data of the french parlement so it can be easily used by contributors. 

Tricoteuses comes in 3 different softwares interacting through a postgres database. 

Softwares are the following :
 - [ ] [Postgres]()
 - [ ] [Tricoteuses-daemon](https://framagit.org/parlement-ouvert/tricoteuses-daemon) : An software for automatic feed our database
 - [ ] [Tricoteuses-api](https://framagit.org/parlement-ouvert/tricoteuses-api) : A graphQL API for requesting database
 - [ ] [Tricoteuses-ui](https://framagit.org/parlement-ouvert/tricoteuses-ui) : Front-end application for exploring data. 
 - [ ] A new GraphQL API for specific use with `assemblée nationale` data.

## Current services states

### DB 

DB should be working. On removing the image and rebuilding, db will automatically fetch current data dump available.

### Daemon

Daemon instance seems to be working. However data processing is stuck. Below are the different states of scripts : 

#### aspireameli.py 

To execute, run in docker bash instance : 
> `python3 aspireameli.py dbname="ameli"\ port="5432"\ host="db"\ user="opendata"\ password="ameli"`


#### aspireliasse.py 

To run : 

>`python3 aspireliasse.py data --verbose`

After init, script seems to be stuck in an infinite loop for retrieval of the same document : 

````
INFO:aspireliasse:get_amendements(bibard=659, bibard_suffixe=, organe=CION_DEF, full=False)
INFO:aspireliasse:get_prochain_a_discuter(organe=CION-CEDU)
INFO:aspireliasse:get_prochain_a_discuter(organe=AN)
INFO:aspireliasse:get_prochain_a_discuter(organe=CION_TOUTE)
INFO:aspireliasse:get_prochain_a_discuter(organe=CION_LOIS)
INFO:aspireliasse:get_prochain_a_discuter(organe=CSCONF)
INFO:aspireliasse:get_prochain_a_discuter(organe=CION_FIN)
INFO:aspireliasse:get_prochain_a_discuter(organe=CION-DVP)
INFO:aspireliasse:get_prochain_a_discuter(organe=CION-SOC)
INFO:aspireliasse:get_prochain_a_discuter(organe=CION_AFETR)
INFO:aspireliasse:get_prochain_a_discuter(organe=CION-ECO)
^CINFO:aspireliasse:get_prochain_a_discuter(organe=CION_DEF)
INFO:aspireliasse:get_prochain_a_discuter(organe=CION-CEDU)
````

#### aspirenosparlementaires.py

To run : 

>`python3 aspirenosparlementaires.py deputes/ --verbose`

Seems to be running but stays silent. 

### API

Server itself starts, however some processing causing exceptions due to some hardcoded broken references for files.


### UI

Install & build works. Instance fails at starting, inside as outside docker, react-scripts instance won't launch. 

Below are the data collected about both tests : 


#### Within docker ####

##### Configuration #####

OS : linux alpine
node : v10.4.0
npm : 6.1.0
bsb : 4.0.2

##### Stacktrace output #####

```
bash-4.4# npm run build

> tricoteuses-ui@0.1.0 build /tricoteuses-ui
> react-scripts build

Creating an optimized production build...
Failed to compile.

./src/index.re
/bin/sh: script: not found


npm ERR! code ELIFECYCLE
npm ERR! errno 1
npm ERR! tricoteuses-ui@0.1.0 build: `react-scripts build`
npm ERR! Exit status 1
npm ERR! 
npm ERR! Failed at the tricoteuses-ui@0.1.0 build script.
npm ERR! This is probably not a problem with npm. There is likely additional logging output above.

npm ERR! A complete log of this run can be found in:
npm ERR!     /root/.npm/_logs/2018-08-01T21_08_51_032Z-debug.log
bash-4.4# 
```

Using : `bsb build`, we get the following message, which is pretty much the one we get without docker : 

```
bash-4.4# bsb -make-world
[12/12] Building src/Json.mlast.d
[1/6] Building src/Json_encode.cmi

  We've found a bug for you!
  /tricoteuses-ui/node_modules/@glennsl/bs-json/src/Json_encode.mli 18:20-29
  
  16 │ (** [int n] makes a JSON number of the [int] [n] *)
  17 │ 
  18 │ external boolean : Js.boolean -> Js.Json.t = "%identity" 
  19 │ (** [boolean b] makes a JSON boolean of the [Js.boolean] [b] *)
  20 │ 
  
  This type constructor's parameter, `Js.boolean`, can't be found. Is it a typo?
  
[2/6] Building src/Json_decode.cmi

  We've found a bug for you!
  /tricoteuses-ui/node_modules/@glennsl/bs-json/src/Json_decode.mli 18:15-24
  
  16 │ exception DecodeError of string
  17 │ 
  18 │ val boolean : Js.boolean decoder
  19 │ (** Decodes a JSON value into a [Js.boolean]
  20 │     
  
  This type constructor's parameter, `Js.boolean`, can't be found. Is it a typo?
  
Failure: /usr/local/lib/node_modules/bs-platform/lib/ninja.exe 
 Location: /tricoteuses-ui/node_modules/@glennsl/bs-json/lib/bs
```

##### Notes #####

`react-scripts` has been tried either globaly as localy. Stacktrace remains. 




#### Without docker docker ####

##### Configuration #####

```
- OS : mac OS 10.13.6
- node : 8.11.2
- npm : 5.6.0
- brew : 1.7.1
- bsb : 4.0.2
``` 

##### Stacktrace output #####

```
[1/6] Building src/Json_encode.cmi

  We've found a bug for you!
  /Users/herbin/www/tricoteuses-ui/node_modules/@glennsl/bs-json/src/Json_encode.mli 18:20-29
  
  16 │ (** [int n] makes a JSON number of the [int] [n] *)
  17 │ 
  18 │ external boolean : Js.boolean -> Js.Json.t = "%identity" 
  19 │ (** [boolean b] makes a JSON boolean of the [Js.boolean] [b] *)
  20 │ 
  
  This type constructor's parameter, `Js.boolean`, can't be found. Is it a typo?
  
[2/6] Building src/Json_decode.cmi

  We've found a bug for you!
  /Users/herbin/www/tricoteuses-ui/node_modules/@glennsl/bs-json/src/Json_decode.mli 18:15-24
  
  16 │ exception DecodeError of string
  17 │ 
  18 │ val boolean : Js.boolean decoder
  19 │ (** Decodes a JSON value into a [Js.boolean]
  20 │     
  
  This type constructor's parameter, `Js.boolean`, can't be found. Is it a typo?
  
Failure: /usr/local/lib/node_modules/bs-platform/lib/ninja.exe 
 Location: /Users/herbin/www/tricoteuses-ui/node_modules/@glennsl/bs-json/lib/bs
 ```


##### Notes #####

### an-api 

Failure. Should give a try with a nightly release dockerized image to fix the following error : 

```
error[E0554]: #![feature] may not be used on the stable release channel
 --> /Users/herbin/.cargo/registry/src/github.com-1ecc6299db9ec823/pear_codegen-0.0.18/src/lib.rs:1:1
  |
1 | #![feature(plugin_registrar, rustc_private, quote)]
  | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

error: aborting due to previous error

For more information about this error, try `rustc --explain E0554`.
``` 
