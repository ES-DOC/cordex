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


# Map of CORDEX collections to data factories / name pre-formatters.
_VOCABS = {
    'c3s-cordex': {
        'institute',
        'rcm_model'
        },
}

# Template input file.
_DIR = os.path.dirname(os.path.realpath(__file__))
_TEMPLATE = os.path.join(_DIR, 'write_bash_vars.template')


def _main(args):
    """Main entry point.

    """
    # Open template.
    with open(args.template_fpath, 'r') as fstream:
        content = fstream.read()

    # Create CORDEX collections.
    for scope in _VOCABS:
        for collection in [pyessv.load('ecmwf:{}:{}'.format(scope, i)) for i in _VOCABS[scope]]:
            data = ''
            for term in collection:
                data += '\t\'{}\'\n'.format(term.canonical_name)
            content = content.replace('[{}]'.format(collection.raw_name.upper()), data)

            data = ''
            for term in collection:
                data += '\t\'{}\'\n'.format(term.raw_name)
            content = content.replace('[{}_RAW]'.format(collection.raw_name.upper()), data)

    # Write output to file system.
    with open(args.output_fpath, 'w') as fstream:
        fstream.write(content)


# Entry point.
if __name__ == '__main__':
    _main(_ARGS.parse_args())
