"""
.. module:: write_bash_vars.py
   :license: GPL/CeCIL
   :platform: Unix, Windows
   :synopsis: Writes vocab terms to a bash file.

.. moduleauthor:: Mark Conway-Greenslade <momipsl@ipsl.fr>

"""
import argparse
import json
import os

import pyessv



# Define command line argument parser.
_ARGS = argparse.ArgumentParser("Generates CORDEX vocab related bash variables.")
_ARGS.add_argument(
    "--output-fpath",
    help="Path to which output will be written",
    dest="output_fpath",
    type=str
    )
_ARGS.add_argument(
    "--template-fpath",
    help="Path to template",
    dest="template_fpath",
    type=str
    )


# Template input file.
_DIR = os.path.dirname(os.path.realpath(__file__))
_TEMPLATE = os.path.join(_DIR, 'write_bash_vars.template')


def _main(args):
    """Main entry point.

    """
    # Open template.
    content = _get_template_content(args.template_fpath)

    # Create CORDEXP collections.
    for collection in pyessv.load("copernicus:cordexp"):
        data = ''
        for term in collection:
            data += '\t\'{}\'\n'.format(term.canonical_name)
        content = content.replace('[__CORDEXP_{}__]'.format(collection.raw_name.upper()), data)
        content = content.replace('[__CORDEXP_{}_RAW__]'.format(collection.raw_name.upper()), data)

    # Create CORDEX collections.
    data = ''
    for term in pyessv.load("ecmwf:c3s-cordex:institute"):
        data += '\t\'{}\'\n'.format(term.canonical_name)
    content = content.replace('[__CORDEX_INSTITUTION_ID__]', data)
    content = content.replace('[__CORDEX_INSTITUTION_ID_RAW__]', data)

    # Write output to file system.
    _set_output(args.output_fpath, content)


def _get_template_content(path_to_template):
    """Returns definitions template.

    """
    with open(path_to_template, 'r') as fstream:
        return fstream.read()


def _set_output(path_to_output, content):
    """Returns definitions template.

    """
    with open(path_to_output, 'w') as fstream:
        fstream.write(content)


# Entry point.
if __name__ == '__main__':
    _main(_ARGS.parse_args())
