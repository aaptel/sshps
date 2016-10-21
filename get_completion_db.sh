#!/bin/bash
set -e

ssh "$@" -- powershell '"get-help * | select name | ft -autosize  "' \
    | perl -nE 'BEGIN{$OK=0;} print if $OK and !/^\s*$/; if(/^---/){$OK++;}' \
    | sort -fu
