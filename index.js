import {readdir, readFile} from 'node:fs/promises'
import path from 'node:path'
import ical from 'ical-generator'
import {parse} from 'yaml'

const calDir = path.join('./', 'movie-club')
const file = s => readFile(s, {encoding: 'utf8'})
const dirFile = s => file(path.join(calDir, s))
const eventFiles = await readdir(path.join(calDir, 'events'))
const meta = await dirFile('meta.yaml')
const events = await Promise.all(eventFiles.map(s => file(path.join(calDir, 'events', s)).then(parse)))
const calendar = ical(meta)
events.forEach(e => calendar.createEvent(e))
console.log(calendar.toString())
