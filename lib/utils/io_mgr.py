"""
.. module:: model_topic.py
   :license: GPL/CeCIL
   :platform: Unix, Windows
   :synopsis: Model topic notebook data wrapper.

.. moduleauthor:: Mark Conway-Greenslade <momipsl@ipsl.fr>


"""
import json
import os

import pyessv

from lib.utils import logger



# Home directory.
CORDEX_HOME = os.getenv('CORDEX_HOME')


def get_folder(parts, create_if_not_found=True):
    """Returns path to an institute's mip-era repository.

    """
    path = os.path.join(CORDEX_HOME)
    path = os.path.join(path, "repos")
    path = os.path.join(path, "institutes")

    for part in parts:
        if part is None:
            continue
        try:
            part.canonical_name
        except AttributeError:
            path = os.path.join(path, part)
        else:
            path = os.path.join(path, part.canonical_name)

    if not os.path.isdir(path) and create_if_not_found:
        os.makedirs(path)

    return path


def get_citations_folder(i):
    """Returns path to an institute's citations directory.

    """
    return get_folder((i, 'cordex', 'citations'))


def get_citations_spreadsheet(i):
    """Returns path to an institute's citations xls file.

    """
    fname = 'cordex_{}_citations.xlsx'.format(i.canonical_name)
    path = get_citations_folder(i)

    return os.path.join(path, fname)


def get_citations_json(i):
    """Returns path to an institute's citations json file.

    """
    fname = 'cordex_{}_citations.json'.format(i.canonical_name)
    path = get_citations_folder(i)
    path = os.path.join(path, 'json')

    return os.path.join(path, fname)


def get_institute_folder(institution):
    """Returns path to an institute's cordex directory.

    """
    return get_folder((institution, 'cordex'))


def get_models_folder(institution):
    """Returns path to an institute's models directory.

    """
    return get_folder((institution, 'cordex', 'models'))


def get_model_folder(institution, source_id, sub_folder=None):
    """Returns path to a directory for a particular model.

    """
    return get_folder((institution, 'cordex', 'models', source_id, sub_folder))


def get_model_cim(institution, source_id):
    """Returns path to cim file for a particular model.

    """
    folder = get_model_folder(institution, source_id, 'cim')
    fname = 'cordex_{}_{}.json'.format(
        institution.canonical_name,
        source_id.canonical_name
        )

    return os.path.join(folder, fname)


def get_model_settings(institution, fname):
    """Returns path to a model settings file.

    """
    folder = get_models_folder(institution)

    return os.path.join(folder, fname)


def get_model_topic_json(institution, source_id, topic):
    """Returns path to json file for a particular model topic.

    """
    folder = get_model_folder(institution, source_id, 'json')
    fname = 'cordex_{}_{}_{}.json'.format(
        institution.canonical_name,
        source_id.canonical_name,
        topic.canonical_name
        )

    return os.path.join(folder, fname)


def get_model_topic_pdf(institution, source_id, topic):
    """Returns path to pdf file for a particular model topic.

    """
    folder = get_model_folder(institution, source_id, 'pdf')
    fname = 'cordex_{}_{}_{}.pdf'.format(
        institution.canonical_name,
        source_id.canonical_name,
        topic.canonical_name
        )

    return os.path.join(folder, fname)


def get_model_topic_xls(institution, model_id, topic):
    """Returns path to xls file for a particular model topic.

    """
    folder = get_model_folder(institution, model_id)
    fname = 'cordex_{}_{}.xlsx'.format(
        model_id.canonical_name.replace("-", "_"),
        topic.canonical_name
        )

    return os.path.join(folder, fname)


def get_parties_folder(i):
    """Returns path to an institute's responsible parties directory.

    """
    return get_folder((i, 'cordex', 'parties'))


def get_parties_spreadsheet(i):
    """Returns path to an institute's responsible parties xls file.

    """
    fname = 'cordex_{}_parties.xlsx'.format(i.canonical_name)
    path = get_parties_folder(i)

    return os.path.join(path, fname)


def get_parties_json(i):
    """Returns path to an institute's responsible parties json file.

    """
    fname = 'cordex_{}_parties.json'.format(i.canonical_name)
    path = get_parties_folder(i)
    path = os.path.join(path, 'json')

    return os.path.join(path, fname)


def _load_json_content(fpath):
    """Returns JSON file content.

    """
    with open(fpath, 'r') as fstream:
        return json.loads(fstream.read())


def load_model_settings(i, fname):
    """Returns model settings content.

    """
    path = get_model_settings(i, fname)

    return _load_json_content(path)


def load_model_topic_json(i, s, t):
    """Returns model topic JSON content.

    """
    path = get_model_topic_json(i, s, t)

    return _load_json_content(path)


def write_model_cim(i, s, content):
    """Writes a model topic JSON file to file system.

    """
    fpath = get_model_cim(i, s)
    logger.log('writing --> {}'.format(fpath.split('/')[-1]), app='SH')
    with open(fpath, 'w') as fstream:
        fstream.write(content)


def write_model_topic_json(i, s, t, content):
    """Writes a model topic JSON file to file system.

    """
    fpath = get_model_topic_json(i, s, t)
    with open(fpath, 'w') as fstream:
        fstream.write(json.dumps(content, indent=4))


def write_model_topic_pdf(i, s, t, content):
    """Writes a model topic PDF file to file system.

    """
    fpath = get_model_topic_pdf(i, s, t)
    with open(fpath, 'w') as fstream:
        fstream.write(str(content))
