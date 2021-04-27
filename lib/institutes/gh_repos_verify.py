"""
.. module:: github_repos_verify.py
   :license: GPL/CeCIL
   :platform: Unix, Windows
   :synopsis: Verifies that all CORDEX instituional GitHub repos exist.

.. moduleauthor:: Mark Conway-Greenslade <momipsl@ipsl.fr>

"""
import argparse
import os

from lib.utils import io_mgr
from lib.utils import logger
from lib.utils import vocabs



# Define command line argument parser.
_ARGS = argparse.ArgumentParser("Scans & validates institutional repos.")
_ARGS.add_argument(
    "--institution-id",
    help="An institution identifier",
    dest="institution_id",
    type=str
    )

# Set of expected sub-folders.
SUB_FOLDERS = (
    'cordex/citations',
    'cordex/models',
    'cordex/parties',
    )

# Set of expected static files.
STATIC_FILES = (
    'cordex/citations/cordex_{}_citations.xlsx',
    'cordex/parties/cordex_{}_parties.xlsx',
    )


def _main(args):
    """Main entry point.

    """
    for i in vocabs.get_institutes(args.institution_id):
        logger.log("verifying {}:".format(i.raw_name))
        errs = []
        for verifier in _VERIFIERS:
            verifier(i, errs)
        for err in errs:
            logger.log("... {}".format(err))
        logger.log_line()


def _verify_repo(i, errs):
    """Verifies that an institutional repo exists.

    """
    path = io_mgr.get_folder([i])
    if not os.path.exists(path):
        errs.append("ERROR: repo not found: {}".format(i.raw_name))


def _verify_sub_folders(i, errs):
    """Verifies that an institutional repo sub-folder exists.

    """
    for sub_folder in SUB_FOLDERS:
        path = [i] + sub_folder.split('/')
        folder = io_mgr.get_folder(path)
        if not os.path.exists(folder):
            errs.append("ERROR: sub-folder not found: {} --> {}".format(i.raw_name, sub_folder))


def _verify_static_files(i, errs):
    """Verifies that a set of institutional static files exists.

    """
    for static_file in STATIC_FILES:
        folder = io_mgr.get_folder([i])
        fname = static_file.format(i.canonical_name)
        path = os.path.join(folder, fname)
        if not os.path.exists(path):
            errs.append("file not found: {}".format(fname))



def _verify_models(i, errs):
    """Verifies that a set of institutional RCM model documentation files exists.

    """
    # Set identifiers of models to be documented.
    identifiers = set([j.canonical_name for j in vocabs.get_models_by_institution(i)])

    # Set directories.
    folder_root = io_mgr.get_folder([i, 'cordex', 'models'])
    documented = set([j for j in os.listdir(folder_root) if os.path.isdir(os.path.join(folder_root, j))])

    # Set undocuemtned & obsolete models.
    undocumented = identifiers.difference(documented)
    obsolete = documented.difference(identifiers)

    # Verify each model and then model topics.
    for model in vocabs.get_models_by_institution(i):
        if model.canonical_name in undocumented:
            errs.append("model undocumented :: {}".format(model.canonical_name.upper()))
        elif model.canonical_name in obsolete:
            errs.append("model obsolete :: {}".format(model.canonical_name.upper()))
        else:
            for topic in vocabs.get_topics():
                topic_xls = io_mgr.get_model_topic_xls(i, model, topic)
                if not os.path.exists(topic_xls):
                    errs.append("model topic undocumented :: {} :: {}".format(model.canonical_name, topic.canonical_name))


# Set of verifiers to be executed.
_VERIFIERS = (
    _verify_repo,
    _verify_sub_folders,
    _verify_static_files,
    _verify_models
    )


# Main entry point.
if __name__ == '__main__':
    _main(_ARGS.parse_args())
