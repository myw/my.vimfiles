#!/bin/bash

# clean-swap-files.sh - clean up vim swap files after crash
#
# Author: @chouser <http://stackoverflow.com/users/7624/chouser>
# From: http://stackoverflow.com/questions/63104/smarter-vim-recovery

TMPDIR=$(mktemp -d) || exit 1

# Temporary files for persistant storage of the recovery text and original filename
RECTXT="$TMPDIR/vim.recovery.$USER.txt"
RECFN="$TMPDIR/vim.recovery.$USER.fn"

# Clean up our own mess if we're ever cancelled
trap 'rm -f "$RECTXT" "$RECFN"; rmdir "$TMPDIR"' 0 1 2 3 15

VIM_SWAP_DIR=${VIM_SWAP_DIR:-~/.vim/swap}

for swapfile in $VIM_SWAP_DIR/.*sw? $VIM_SWAP_DIR/*.sw?; do

  # Only deal with real files
  [[ -f $swapfile ]] || continue

  # Clean up any work from the previous recovery
  rm -f "$RECTXT" "$RECFN"

  # Load the contents of the recovered file and save its filename to $RECFN
  vim -X -r "$swapfile" \
      -c "w! $RECTXT" \
      -c "let fn=expand('%:p')" \
      -c "new $RECFN" \
      -c "exec setline( 1, fn )" \
      -c w\! \
      -c "qa!"

  if [[ ! -f $RECFN ]]; then
    echo "- removing empty swap file $swapfile"
    rm -f "$swapfile"
    continue
  fi

  currentfile="$(cat $RECFN)"

  if diff --strip-trailing-cr --brief "$currentfile" "$RECTXT"; then
    echo "- removing redundant swap file $swapfile"
    echo "  for $currentfile"

    rm -f "$swapfile"
  else
    echo "- swap file $swapfile contains changes: editing"

    vim -n -d "$currentfile" "$RECTXT"

    # Break early if we don't decide to delete the swap file
    rm -i "$swapfile" || exit
  fi
done

# vim: set et fenc= ff=unix sts=2 sw=2 ts=2 :
