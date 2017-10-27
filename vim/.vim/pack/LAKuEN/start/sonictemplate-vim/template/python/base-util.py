# coding: UTF-8
'''Summary
'''
import argparse
import codecs
import csv
import os
import sys


def main():
    {{_cursor_}}
    return


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("arg1", help="",
                        type=int)
    parser.add_argument("--arg2", help="",
                        type=int, default=1)
    parser.add_argument("--bool_arg", help="",
                        action="store_true")
    args = parser.parse_args()

    main()
