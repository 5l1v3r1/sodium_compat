#!/usr/bin/env bash

php php52-phpunit.phar
EXITCOMMAND=$?
if [[ "$EXITCOMMAND" -ne 0 ]]; then exit $EXITCOMMAND; fi

php php52-phpunit.phar --bootstrap autoload-fast.php
EXITCOMMAND=$?
if [[ "$EXITCOMMAND" -ne 0 ]]; then exit $EXITCOMMAND; fi

if [[ $CHECK_MBSTRING -eq 1 ]]; then
  php -dmbstring.func_overload=7 php52-phpunit.phar
  EXITCOMMAND=$?
  if [[ "$EXITCOMMAND" -ne 0 ]]; then exit $EXITCOMMAND; fi
  php -dmbstring.func_overload=7 php52-phpunit.phar --bootstrap autoload-fast.php
  EXITCOMMAND=$?
  if [[ "$EXITCOMMAND" -ne 0 ]]; then exit $EXITCOMMAND; fi
fi
