"""
.. module:: archive_cim_documents.py
   :license: GPL/CeCIL
   :platform: Unix, Windows
   :synopsis: Moves generated CORDEXP  model CIM documets into archive.

.. moduleauthor:: Mark Conway-Greenslade <momipsl@ipsl.jussieu.fr>

"""
import argparse
import hashlib
import os
import shutil

from lib.utils import io_mgr
from lib.utils import vocabs



# Define command line argument parser.
_ARGS = argparse.ArgumentParser("Synchronizes CORDEX model CIM files & main archive.")
_ARGS.add_argument(
    "--destination",
    help="Folder to which CIM documents will be copied.",
    dest="dest",
    type=str
    )


def _main(args):
    """Main entry point.

    """
    if not os.path.exists(args.dest):
        raise ValueError("Destination folder is invalid")

    domains = vocabs.get_domains()
    for institution in vocabs.get_institutes():
        for model in vocabs.get_models_by_institution(institution):
            for domain in domains:
                fpath = io_mgr.get_model_cim(institution, domain, model)                
                if not os.path.exists(fpath):
                    continue

                fname = hashlib.md5(fpath.split("/")[-1]).hexdigest()
                shutil.copy(
                    fpath,
                    os.path.join(args.dest, '{}.json'.format(fname))
                    )

# Main entry point.
if __name__ == '__main__':
    _main(_ARGS.parse_args())
