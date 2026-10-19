#!/usr/bin/env python3
"""Check the bundled 18-document Test 106 derivative CSV. Standard library only.

This does NOT verify the native original result ZIPs or replicate a benchmark.
"""
from pathlib import Path
from hashlib import sha256
import csv
import math

root = Path(__file__).resolve().parents[1]
source = root / 'evidence' / 'TEST106_Public_18JSON_PerDocument_Results_EN.csv'
expected_sha256 = '23e538a714d1820d2b6d4711a7569c2999975db5cc8ff5a268686c75eb858283'
assert sha256(source.read_bytes()).hexdigest() == expected_sha256, 'CSV bytes changed'
with source.open(newline='', encoding='utf-8') as fh:
    rows = list(csv.DictReader(fh))
assert len(rows) == 18, f'Expected 18 documents, got {len(rows)}'
assert len({r['document'] for r in rows}) == 18, 'Duplicate document names'
assert len({r['sha256'] for r in rows}) == 18, 'Duplicate document digests'

def geom(key):
    vals = [float(r[key]) for r in rows]
    assert all(math.isfinite(v) and v > 0 for v in vals)
    return math.exp(sum(math.log(v) for v in vals) / len(vals))

expected = {
    'cloudv_stable_vs_official': 1.6007,
    'epcc_stable_vs_official': 1.8946,
    'cloudv_stable_vs_A2': 1.00001,
    'epcc_stable_vs_A2': 0.99959,
}
for name, value in expected.items():
    measured = geom(name)
    assert abs(measured - value) < 0.0001, (name, measured, value)
    print(f'{name}: {measured:.6f}x')
assert all(float(r['cloudv_stable_vs_official']) > 1 for r in rows)
assert all(float(r['epcc_stable_vs_official']) > 1 for r in rows)
assert min(float(r['cloudv_stable_vs_A2']) for r in rows) > 0.98
assert min(float(r['epcc_stable_vs_A2']) for r in rows) > 0.98
assert geom('cloudv_NL4_vs_A2') < 0.995
assert min(float(r['cloudv_NL4_vs_A2']) for r in rows) < 0.98
print('PASS: final 18-document derivative table agrees with reported main ratios.')
print('NOT CHECKED: the original raw Test 106 ZIPs, CI, source identity or RVV builds.')
