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
    path = os.path.join(path, "institutions")

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


def get_folder_for_data(sub_folder="global", create_if_not_found=True, data_type="json"):
    """Returns path to a data folder.

    """
    path = os.path.join(CORDEX_HOME, "data")
    path = os.path.join(path, "cordexp")
    path = os.path.join(path, data_type)
    path = os.path.join(path, sub_folder)
    if create_if_not_found and not os.path.isdir(path):
        os.makedirs(path)

    return path


def get_citations_folder(i):
    """Returns path to an institute's citations directory.

    """
    return get_folder((i, 'cordexp', 'citations'))


def get_citations_folder_for_data(i):
    """Returns path to an institute's citations directory.

    """
    return get_folder_for_data(i.canonical_name)


def get_citations_spreadsheet(i):
    """Returns path to an institute's citations xls file.

    """
    fname = 'cordexp_{}_citations.xlsx'.format(i.canonical_name).replace("-", "_")

    return os.path.join(get_citations_folder(i), fname)


def get_citations_json(i):
    """Returns path to an institute's citations json file.

    """
    return os.path.join(get_citations_folder_for_data(i), "citations.json")


def get_institute_folder(institution):
    """Returns path to an institute's cordexp directory.

    """
    return get_folder((institution, 'cordexp'))


def get_models_folder(institution):
    """Returns path to an institute's models directory.

    """
    return get_folder((institution, 'cordexp', 'models'))


def get_model_folder(institution, source_id, sub_folder=None):
    """Returns path to a directory for a particular model.

    """
    return get_folder((institution, 'cordexp', 'models', source_id, sub_folder))


def get_model_folder_for_data(source_id, data_type):
    """Returns path to an institute's citations directory.

    """
    return get_folder_for_data(source_id.canonical_name, data_type=data_type)


def get_model_cim(institution, domain, source_id):
    """Returns path to cim file for a particular model.

    """
    folder = get_model_folder_for_data(institution, "cim")
    fname = "{}_{}.json".format(
        domain.canonical_name,
        source_id.canonical_name, 
        ).replace("-", "_")

    return os.path.join(folder, fname)


def get_model_topic_json(institution, source_id, topic, domain):
    """Returns path to json file for a particular model topic.

    """
    folder = get_model_folder_for_data(institution, "json")
    fname = "{}_{}_{}.json".format(
        domain.canonical_name,
        source_id.canonical_name, 
        topic.canonical_name,
        ).replace("-", "_")

    return os.path.join(folder, fname)


def get_model_topic_xls(institution, source_id, topic, domain):
    """Returns path to xls file for a particular model topic.

    """
    folder = get_model_folder(institution, source_id)
    fname = "cordexp_{}_{}_{}.xlsx".format(
        domain.canonical_name,
        source_id.canonical_name, 
        topic.canonical_name,
        ).replace("-", "_")

    return os.path.join(folder, fname)


def get_parties_folder(i):
    """Returns path to an institute's responsible parties directory.

    """
    return get_folder((i, 'cordexp', 'parties'))


def get_parties_folder_for_data(i):
    """Returns path to an institute's responsible parties directory.

    """
    return get_folder_for_data(i.canonical_name)


def get_parties_spreadsheet(i):
    """Returns path to an institute's responsible parties xls file.

    """
    fname = 'cordexp_{}_parties.xlsx'.format(i.canonical_name).replace("-", "_")
    path = get_parties_folder(i)

    return os.path.join(path, fname)


def get_parties_json(i):
    """Returns path to an institute's responsible parties json file.

    """
    return os.path.join(get_parties_folder_for_data(i), "parties.json")


def load_model_topic_json(i, s, t, d):
    """Returns model topic JSON content.

    """
    path = get_model_topic_json(i, s, t, d)

    return _load_json_content(path)


def write_model_cim(i, d, s, obj):
    """Writes a model topic JSON file to file system.

    """
    fpath = get_model_cim(i, d, s)
    logger.log('writing --> {}'.format(fpath), app='SH')
    with open(fpath, 'w') as fstream:
        fstream.write(obj)


def write_model_topic_json(i, s, t, d, obj):
    """Writes a model topic JSON file to file system.

    """
    fpath = get_model_topic_json(i, s, t, d)
    with open(fpath, 'w') as fstream:
        fstream.write(json.dumps(obj, indent=4))


def _load_json_content(fpath):
    """Returns JSON file content.

    """
    with open(fpath, 'r') as fstream:
        return json.loads(fstream.read())
