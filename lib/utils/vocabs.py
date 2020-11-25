"""
.. module:: pyessv.utils.logger.py
   :copyright: Copyright "December 01, 2016", IPSL
   :license: GPL/CeCIL
   :platform: Unix, Windows
   :synopsis: Package logging utility functions.

.. moduleauthor:: Mark Conway-Greenslade <momipsl@ipsl.jussieu.fr>


"""
import pyessv



# Set of participating institutes.
_INSTITUTES = pyessv.ECMWF.c3s_cordex.institute

# Set of participating institutes.
_MODELS = pyessv.ECMWF.c3s_cordex.rcm_model


def get_institute(institution_id):
    """Returns institute to be processed.

    """
    return _INSTITUTES[institution_id]


def get_institutes(institution_id=None):
    """Returns set of institutes to be processed.

    """
    if institution_id in (None, '', 'all'):
        return _INSTITUTES
    
    return get_institute(institution_id)


def get_model(model_id):
    """Returns rcm-model to be processed.

    """
    return _MODELS[model_id]


def get_models(model_id=None):
    """Returns set of rcm-models to be processed.

    """
    if model_id in (None, '', 'all'):
        return _MODELS
    
    return get_model(model_id)


def get_models_by_institute(institution_id=None):
    """Returns set of rcm-models to be processed filtered by institute.

    """
    result = []
    for model in get_models():
        if model.raw_name.split("-")[0] == institution_id.raw_name:
            result.append(model)

    return result


def get_topics():
    """Returns set of topics to be documented.

    """
    return {
        'top_level',
    }
