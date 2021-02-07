#!/usr/bin/python3.9
# -*- coding: utf-8 -*-
import re
import sys
import os import getcwd, sep
from ..helpers import Command

class Paths:
    """
    Provides some paths related configuration.
    """

    directory_separator = sep
    """
    Set the current directory separator.
    """

    current_directory = getcwd() + directory_separator
    """
    Provides the current directory.
    """

    pyfunceble_config_directory = (
        current_directory + ".pyfunceble" + directory_separator
    )
    """
    Provides the location of the PyFunceble configurations.
    """

    info_filename = "info.json"
    """
    Provides the filename of our admin file.
    """

    origin_filename = "origin.list"
    """
    Provides the filename we will use to save the original file (from upstream)
    """

    input_filename = "domains.list"
    """
    Provides the filename we have to read.
    """

    output_filename = "clean.list"
    """
    Provides the filename we generate after a test of a list is done.
    """

    readme_filename = "README.md"
    """
    Provides the filename of our README.
    """

    travis_filename = ".travis.yml"
    """
    Provides the filename of our .travis.yml file.
    """

    git_base_name = _base_name = (
        Command("basename `git rev-parse --show-toplevel`").get_command_output().strip()
    )
    """
    Provides the name of the git repository.
    """
