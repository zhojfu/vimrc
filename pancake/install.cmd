if not exist "%HOME%" @set HOME=%USERPROFILE%
@set APP_PATH=%HOME%\.pancake\.vim


call mklink "%HOME%\.vimrc" "%APP_PATH%\.vimrc"
call mklink "%HOME%\_vimrc" "%APP_PATH%\.vimrc"
call mklink "%HOME%\.vimrc.bundles" "%APP_PATH%\.vimrc.bundles"
call mklink /J "%HOME%\.vim" "%APP_PATH%"

IF NOT EXIST "%APP_PATH%\bundle" (
    call mkdir "%APP_PATH%\bundle"
)

IF NOT EXIST "%APP_PATH%/bundle/vundle" (
    call git clone https://github.com/gmarik/vundle.git "%APP_PATH%/bundle/vundle"
) ELSE (
  call cd "%APP_PATH%/bundle/vundle"
  call git pull
  call cd %HOME%
)

call vim -u "%APP_PATH%/.vimrc.bundles" +BundleInstall! +BundleClean +qall
