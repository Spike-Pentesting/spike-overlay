#!/bin/bash
#and3k-sunrise on bitbucket some items for repo maintenance borrowed 

egencache --repo spike-community-overlay --update-use-local-desc $@
egencache --repo spike-community-overlay --update-manifests --sign-manifests=y $@
