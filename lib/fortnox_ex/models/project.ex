defmodule FortnoxEx.Models.Project do
  import FortnoxEx.Utils, only: [process_response: 2, stream_resource: 3]

  @doc """
  Creates a project

  ## Examples

    iex> create_project(client, %{"Name" => "ACME")
    {:ok, %{"ProjectNumber" => "1", "Name" => "ACME"}}

    iex> create_project(client, project_attrs)
    {:error, fortnox_error}

  """
  def create_project(client, project_data) do
    Tesla.post(client, "/3/projects", %{"Project" => project_data})
    |> process_response("Project")
  end

  @doc """
  Gets a list of partial project objects with pagination information.

  ## Examples

    iex> list_projects(client, [])
    {:ok, %{"@CurrentPage" => 1, "@TotalPages" => 1, "@TotalResources" => 1}, [%{"ProjectNumber" => "1", "Name" => "ACME"}]}

    iex> list_projects(client, [])
    {:error, fortnox_error}
  """
  def list_projects(client, query) do
    Tesla.get(client, "/3/projects", query: query)
    |> process_response("Projects")
  end

  @doc """
  Streams a partial project objects. Will go through each page of results with a delay between page.
  The stream will produce a single project data object for each hit.

  ## Examples

    iex> stream_projects(client, [])
    stream_of_projects

    iex> stream_projects(client, [])
    {:error, fortnox_error}
  """
  def stream_projects(client, query) do
    stream_resource(client, &list_projects/2, query)
  end

  @doc """
  Gets a project

  ## Examples

    iex> get_project(client, "1")
    {:ok, %{"ProjectNumber" => "1", "Name" => "Johnny", ...}

    iex> get_project(clientm "1")
    {:error, fortnox_error}

  """
  def get_project(client, project_number) do
    Tesla.get(client, "/3/projects/#{project_number}")
    |> process_response("Project")
  end

  @doc """
  Updates a project

  ## Examples

    iex> update_project(client, "1", %{"Name" => "Johnny"})
    {:ok, %{"ProjectNumber" => "1", "Name" => "Johnny", ...}

    iex> update_project(clientm "1", project_attrs)
    {:error, fortnox_error}

  """
  def update_project(client, project_number, project_data) do
    Tesla.put(client, "/3/projects/#{project_number}", %{"Project" => project_data})
    |> process_response("Project")
  end

  @doc """
  Deletes a project

  ## Examples

    iex> delete_project(client, "1")
    :ok

    iex> delete_project(client, "missing")
    {:error, fortnox_error}

  """
  def delete_project(client, project_number) do
    Tesla.delete(client, "/3/projects/#{project_number}")
    |> process_response(nil)
  end
end
