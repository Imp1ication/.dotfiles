#!/bin/bash

source setup.sh

# .config dir list
for dir in "${dir_list[@]}"; do
    # delete existing folders
    if [ -d "$CONF_DIR/$dir" ]; then
        if confirm "$CONF_DIR/$dir already exists. Delete it?"; then
            action_echo ${Red} "deleting" "$CONF_DIR/$dir..."
            rm -rf "$CONF_DIR/$dir"
        else
            action_echo ${Yel} "skipping" "$CONF_DIR/$dir..."
            echo # empty line
            continue
        fi
    fi

    # symlink new folders
    action_echo ${Gre} "symlinking" "$DOT_DIR/$dir to $CONF_DIR/$dir..."
    ln -sf "$DOT_DIR/$dir" "$CONF_DIR/$dir"

    echo # empty line
done

# bin file list
for bin in "${bin_list[@]}"; do
    # delete existing files
    if [ -f "$BIN_DIR/$bin" ]; then
        if confirm "$BIN_DIR/$bin already exists. Delete it?"; then
            action_echo ${Red} "deleting" "$BIN_DIR/$bin..."
            rm -rf "$BIN_DIR/$bin"
        else
            action_echo ${Yel} "skipping" "$BIN_DIR/$bin..."
            echo # empty line
            continue
        fi
    fi

    # symlink new files
    action_echo ${Gre} "symlinking" "$DOT_DIR/bin/$bin to $BIN_DIR/$bin..."
    ln -sf "$DOT_DIR/bin/$bin" "$BIN_DIR/$bin"

    echo # empty line
done

