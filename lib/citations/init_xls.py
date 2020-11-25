"""
.. module:: init_xls.py
   :license: GPL/CeCIL
   :platform: Unix, Windows
   :synopsis: Initialises CORDEXP citation spreadsheets.

.. moduleauthor:: Mark Conway-Greenslade <momipsl@ipsl.fr>

"""
import argparse
import os
import shutil

from lib.utils import io_mgr
from lib.utils import vocabs



# Define command line argument parser.
_ARGS = argparse.ArgumentParser("Initialises CORDEXP model citation spreadsheets.")
_ARGS.add_argument(
    "--institution-id",
    help="An institution identifier",
    dest="institution_id",
    type=str,
    default="all"
    )
_ARGS.add_argument(
    "--xls-template",
    help="Path to XLS template",
    dest="xls_template",
    type=str
    )


def _main(args):
    """Main entry point.

    """
    # Defensive programming.
    if not os.path.exists(args.xls_template):
        raise ValueError("XLS template file does not exist")

    # Write one file per institute.
    for i in vocabs.get_institutes(args.institution_id):
        dest = io_mgr.get_citations_spreadsheet(i)
        print(dest)
        # if not os.path.exists(dest):
        #     shutil.copy(args.xls_template, dest)


# Main entry point.
if __name__ == '__main__':
    _main(_ARGS.parse_args())
