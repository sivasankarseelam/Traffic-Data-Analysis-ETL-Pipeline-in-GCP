if 'transformer' not in globals():
    from mage_ai.data_preparation.decorators import transformer
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@transformer
def transform(data, *args, **kwargs):
    """
    Template code for a transformer block.

    Add more parameters to this function if this block has multiple parent blocks.
    There should be one parameter for each output variable from each parent block.

    Args:
        data: The output from the upstream parent block
        args: The output from any additional upstream blocks (if applicable)

    Returns:
        Anything (e.g. data frame, dictionary, array, int, str, etc.)
    """
    # Define a mapping dictionary for road types
    road_type_mapping = {
        "01 A Road": "Major Road",
        "02 B Road": "Minor Road",
        "03 C Road": "Local Road",
        # Add more mappings as needed
    }

    # Function to map road types using the mapping dictionary
    def map_road_type(road_type):
        return road_type_mapping.get(road_type, "Other")

    # Apply the mapping function to the Road type column
    data["Road type"] = data["Road type"].apply(map_road_type)

    return data


@test
def test_output(output, *args) -> None:
    """
    Template code for testing the output of the block.
    """
    assert output is not None, 'The output is undefined'
