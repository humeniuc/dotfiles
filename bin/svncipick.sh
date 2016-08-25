#!/bin/bash
svn ci $(svn status | awk '!/^?/{print $2}' | tovim)

