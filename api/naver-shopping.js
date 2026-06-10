export const config = { runtime: 'edge' };

export default async function handler(req) {
  const clientId = process.env.NAVER_CLIENT_ID;
  const clientSecret = process.env.NAVER_CLIENT_SECRET;

  const url = new URL(req.url);
  const params = url.searchParams.toString();

  const response = await fetch(
    `https://openapi.naver.com/v1/datalab/shopping/categories?${params}`,
    {
      method: 'GET',
      headers: {
        'X-Naver-Client-Id': clientId,
        'X-Naver-Client-Secret': clientSecret,
      },
    }
  );

  const data = await response.json();

  return new Response(JSON.stringify(data), {
    headers: {
      'Content-Type': 'application/json',
      'Access-Control-Allow-Origin': '*',
    },
  });
}
