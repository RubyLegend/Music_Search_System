# importing libraries
import requests
# import cloudscraper #cloudflare v2 block
# import webbrowser - don't needed anymore, but will save it, mb for future
from bs4 import BeautifulSoup
import sys
from selenium import webdriver
import html2text
import os
import re
import pymysql.cursors

#Connection data to Spotify
client_id = '74d9ae9d573f400d9d5bd276ed9718d6'

def get_from_spotify(artist, song):
    auth_url = 'https://accounts.spotify.com/api/token'
    
    data = {
        'grant_type': 'client_credentials',
        'client_id': client_id,
        'client_secret': client_secret,
    }

    auth_response = requests.post(auth_url, data=data)
    access_token = auth_response.json().get('access_token')

    #print(access_token)

    base_url = 'https://api.spotify.com/v1/search?'
    
    headers = {
        'Authorization': 'Bearer {}'.format(access_token)
    }
    
    params = 'q='
    
    params = ''.join([params,song])
    
    if(artist != ''):
        params = '&'.join([params, ''.join(["artist=", artist])])
    

    full_url = ''.join([base_url,params,'&type=track'])
    
    #print(full_url)

    response = requests.get(full_url, headers=headers)
    
    track_id = str(response.json()['tracks']['items'][0]['id'])
    
    base_url = 'https://api.spotify.com/v1/tracks/'
    full_url = ''.join([base_url,track_id])

    response = requests.get(full_url, headers=headers)
    
    ### Stopped on a problem - no genres field in response
    #for x in response.json()['artists'][0]:
    #    print(x)