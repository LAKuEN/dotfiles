# coding: UTF-8
'''Summary

Usage:
    python {{_name_}}
'''
import codecs
import csv
import os
from pprint import pprint
import sys


def main():
    {{_cursor_}}
    return


if __name__ == "__main__":
    if len(sys.argv) == 2:
        main(*sys.argv[1:])
    else:
        print("{0}\n{1}\n{0}".format("="*100, __doc__))

