interface HttpOptions {
  headers?: HeadersInit | undefined;
  body?: Object | undefined | null;
}

const csrfTokenMeta = document.querySelector<HTMLMetaElement>(
  'meta[name="csrf-token"]'
);

const csrfToken = csrfTokenMeta?.content;

const headers = (additional: HeadersInit | undefined) => ({
  'X-CSRF-Token': csrfToken || '',
  ...additional
});

const get = async (url: string, opts: HttpOptions = {}): Promise<Response> => {
  return await fetch(url, {
    method: 'GET',
    headers: headers(opts.headers)
  });
};

const post = async (url: string, opts: HttpOptions = {}): Promise<Response> => {
  return await fetch(url, {
    method: 'POST',
    headers: headers(opts.headers),
    body: JSON.stringify(opts.body)
  });
};

const patch = async (
  url: string,
  opts: HttpOptions = {}
): Promise<Response> => {
  return await fetch(url, {
    method: 'PATCH',
    headers: headers(opts.headers),
    body: JSON.stringify(opts.body)
  });
};

const put = patch;

const del = async (url: string, opts: HttpOptions = {}): Promise<Response> => {
  return await fetch(url, {
    method: 'DELETE',
    headers: headers(opts.headers)
  });
};

export { get, post, patch, put, del };
